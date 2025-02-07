namespace java dev.vality.gambit
namespace erlang gambit

/** Алгоритм хеширования вы выбираете сами, мы рекомендуем murmur3 из-за легковесности. */
typedef i32 Hash
/** Имя источника набора данных. */
typedef string DataSetName
/** Идентификатор для привязки записи. */
typedef string BindId

struct DataRequest {
    1: required set<string> data_sets_names
    2: required Hash lookup_key
}

struct DataRowRequest {
    1: required DataSetName data_set_name
}

struct BindingDataRowRequest {
    1: required DataSetName data_set_name
    2: required BindId bind_id
}

struct DataResponse {
    1: required map<string, string> data
}

struct DataSetResponse {
    1: required list<DataRow> rows
}

struct DataRow {
    1: required map<string, string> row
}

struct DataSetRequest {
    1: required string data_set_name
    2: required File file
}

union File {
    1: binary csv
}

exception DataSetNotFound {}

exception DataSetAlreadyExists {}

/**
* Интерфейс для работы с данными
*/
service StubDataService {

    /**
     * Получение данных из нескольких источников
     */
    DataResponse GetData (1: DataRequest data_request) throws (1: DataSetNotFound ex);

    /**
     * Получение всех данных источника
     */
    DataSetResponse GetFullDataSet (1: DataRowRequest data_row_request) throws (1: DataSetNotFound ex);

    /**
     * Получение случайной записи из одного источника
     */
    DataResponse GetRandomDataRow (1: DataRowRequest data_row_request) throws (1: DataSetNotFound ex);

    /**
     * Получение случайной записи из одного источника c привязкой к идентификатору
     */
    DataResponse GetBindingDataRow (1: BindingDataRowRequest binding_data_row_request) throws (1: DataSetNotFound ex);

    /**
     * Создание набора данных
     */
    void CreateDataSet (1: DataSetRequest data_set_request) throws (1: DataSetAlreadyExists ex);

    /**
     * Добавление записей в существующий набор данных
     */
    void UpdateDataSet (1: DataSetRequest data_set_request) throws (1: DataSetNotFound ex);

}