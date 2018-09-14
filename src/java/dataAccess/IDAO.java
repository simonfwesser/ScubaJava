package dataAccess;

public interface IDAO{

    void openSession();

    void closeSession();

    void beginTransaction();

    void commitTransaction();

}
