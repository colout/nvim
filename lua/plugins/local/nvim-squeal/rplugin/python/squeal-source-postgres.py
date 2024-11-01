#
#import asyncio
#from time import sleep
#
#import pynvim
#from pynvim.api.nvim import Nvim
#
#
#@pynvim.plugin
#class SquealSourcePostgres(object):
#    def __init__(self, nvim: Nvim) -> None:
#        self.nvim = nvim
#
#    @pynvim.function("LongBlock")
#    def long_block(self, args):
#        sleep(5)
#        self.nvim.command('echo "done with blocking stuff"')
#
#    @pynvim.function("AsyncNoBlock")
#    def async_no_block(self, args):
#        async def no_block():
#            await asyncio.sleep(5)
#            self.nvim.command('echo "done with async stuff"')
#
#        self.nvim.loop.create_task(no_block())
