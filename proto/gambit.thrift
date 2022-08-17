namespace java dev.vality.gambit
namespace erlang gambit

typedef i32 Hash

struct DataRequest {
    1: required string dataset_name
    2: required Hash hash
}

struct IpRequest {
    1: required Hash hash
}

struct DataResponse {
    1: required map<string, string> data
}

struct IpResponse {
    1: required string ip
}

exception DataSetNotFound {}

/**
* Интерфейс для получения данных
*/
service StubDataService {

    /**
     * Получение данных из соответствующего источника
     */
    DataResponse GetData (1: DataRequest data_request) throws (1: DataSetNotFound ex);

    /**
     * Получение ip адреса
     */
    IpResponse GetIp (1: IpRequest ip_request) throws (1: DataSetNotFound ex);

}