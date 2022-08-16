namespace java dev.vality.gambit
namespace erlang gambit

struct DataRequest {
    1: required string dataset_name
    2: required i32 hash
}

struct IpRequest {
    1: required i32 hash
}

struct DataResponse {
    1: required map<string, string> data
}

struct IpResponse {
    1: required string ip
}

/**
* Интерфейс для получения данных
*/
service GambitService {

    /**
     * Получение данных из соответствующего источника
     */
    DataResponse GetData (1: DataRequest data_request)

    /**
     * Получение ip адреса
     */
    IpResponse GetIp (1: IpRequest ip_request)

}