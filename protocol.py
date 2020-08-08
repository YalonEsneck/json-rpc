from twisted.internet.protocol import Protocol

class JSONRPC(Protocol):

    """ Data is received. Parse and compute it and reply results. """
    def dataReceived(self, data):
        self.transport.write(data)
