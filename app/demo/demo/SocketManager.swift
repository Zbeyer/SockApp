import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var socket: SocketIOClient!

    // defaultNamespaceSocket and swiftSocket both share a single connection to the server
    let manager = SocketManager(socketURL: URL(string: "http://localhost:4000")!, config: [.log(true), .compress])

    override init() {
        super.init()

        socket = manager.defaultSocket
    }

    func connectSocket() {
//        let token = UserDefaults.standard.getAccessToken()

//        self.manager.config = SocketIOClientConfiguration(
//            arrayLiteral: .connectParams(["token": token]), .secure(true)
//        )
        socket.connect()
    }

    func receiveMsg() {
        socket.on("new message here") { (dataArray, ack) in

            print(dataArray.count)

        }
    }
}
