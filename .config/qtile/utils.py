# -*- coding: utf-8 -*-

from libqtile.log_utils import logger
from subprocess import Popen, PIPE
import re
from time import sleep
import sys
from six.moves import xrange


def nonblocking(on_result):
    # Not sure if this is actually called anywhere.
    def callable_fn(fn):
        def wrapper(self, *args, **kwargs):
            def on_done(future):
                try:
                    result = future.result()
                except Exception:
                    logger.exception('Polling raised exception')
                    result = None
                on_result(self, result)

            future = self.qtile.run_in_executor(fn)
            future.add_done_callback(on_done)
        return wrapper
    return callable_fn


class NonBlockingSpawn(object):
    """
    This mixin provides a `spawn` method that performs
    long-running operations within magic Qtile task executor.
    Very handy for use in custom widgets to avoid blocking main loop.
    """
    def spawn(self, fn, result_cb):
        def on_done(future):
            try:
                result = future.result()
            except Exception:
                logger.exception('Polling raised exception')
                result = None
            result_cb(result)

        future = self.qtile.run_in_executor(fn)
        future.add_done_callback(on_done)


class DMenu(object):
    def __init__(self, run=False, width=400, height=240, **kwargs):
        self.kwargs = kwargs
        self.app = 'dmenu_run' if run else 'dmenu'
        self.width = width
        self.height = height

    def run_menu(self, items=None):
        if not items:
            items = []
        out = Popen(['xrandr', '--current'], stdout=PIPE, stderr=PIPE).communicate()[0]
        w, h = re.findall(b'(\d+)x(\d+)\s*[\d\.]+\*', out)[0]
        w = int(w)
        h = int(h)
        self.kwargs['x'] = (w - self.width) / 2
        self.kwargs['y'] = (h - self.height) / 2
        self.kwargs['w'] = self.width
        args = [self.app]
        args.extend(map(str, sum(map(list, (filter(None, ('-' + k, v)) for k, v in self.kwargs.items())), [])))
        stdin = u'\n'.join(items).encode('utf-8')
        proc = Popen(args, stdin=PIPE, stdout=PIPE, stderr=PIPE)
        out, err = proc.communicate(stdin)
        if proc.returncode != 0:
            logger.error('Dmenu terminated with the non-zero code {}\nSTDOUT: {}\nSTDERR: {}'.format(proc.returncode, out, err))
        return out


bar_styles = [
    u'▁▂▃▄▅▆▇█',
    u'⣀⣄⣤⣦⣶⣷⣿',
    u'⣀⣄⣆⣇⣧⣷⣿',
    u'○◔◐◕⬤',
    u'□◱◧▣■',
    u'□◱▨▩■',
    u'□▨▩■',
    u'□◱▥▦■',
    u'░▒▓█',
    u'░█',
    u'⬜⬛',
    u'▱▰',
    u'▭◼',
    u'▯▮',
    u'◯⬤',
    u'⚪⚫',
    u' ▏▎▍▌▋▊▉█',
    u'▁▂▃▄▅▆▇█'
]


# def progress(min, max, current, width, style=0, before=u'⎹', after=u'⎸'):
def progress(min, max, current, width, style=0, before=u'▕', after=u'▎'):
    style = bar_styles[style]
    q_max = len(style) * width
    ratio = float(current - min) / (max - min)
    q_current = int(ratio * q_max)
    return before + ''.join([
        style[-1]
        if x <= q_current
        else style[q_current - x]
        if x - q_current < len(style)
        else style[0]
        for x
        in [y * len(style) for y in xrange(1, width + 1)]
    ]) + after


if __name__ == '__main__':
    for style in (16, 0, 1, 6, 8):
        for i in xrange(0, 101):
            sys.stdout.write('\r' + progress(0, 100, i, 6, style=style) + ' %3d%% ' % i)
            sys.stdout.flush()
            sleep(0.01)
        sys.stdout.write('\n\n')
