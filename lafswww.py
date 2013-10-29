from fs.contrib.tahoelafs import TahoeLAFS
from fs.expose import http
from commandr import command, Run

@command('start')
def start(capability, address = '', port = 8000):
    fs = TahoeLAFS(capability)
    http.serve_fs(fs, address, port)

if __name__ == '__main__':
    Run()
