from twisted.internet.protocol import Factory
from twisted.internet.endpoints import TCP4ServerEndpoint
from twisted.internet import reactor

from protocol import JSONRPC

class JSONRPCFactory(Factory):

    def buildProtocol(self, addr):
        return JSONRPC()

print("Start")
endpoint = TCP4ServerEndpoint(reactor, 12345)
endpoint.listen(JSONRPCFactory())
reactor.run()
print("End")
