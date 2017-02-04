import Darwin

var stderrStream = STDErrOutputStream()

struct STDErrOutputStream: TextOutputStream {
    func write(_ string: String) {
        fputs(string, stderr)
    }
}
