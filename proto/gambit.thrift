namespace java dev.vality.gambit
namespace erlang gambit

// Алгоритм хеширования вы выбираете сами, мы рекомендуем murmur3 из-за легковесности.
typedef i32 Hash

struct DataRequest {
    1: required set<string> data_sets_names
    2: required Hash lookup_key
}

struct DataResponse {
    1: required map<string, string> data
}

exception DataSetNotFound {}

/**
* Интерфейс для получения данных
*/
service StubDataService {

    /**
     * Получение данных из нескольких источников
     */
    DataResponse GetData (1: DataRequest data_request) throws (1: DataSetNotFound ex);

}