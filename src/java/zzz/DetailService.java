package zzz;

import zzz.DetailDAO;
import entite.Detail;
import java.util.List;


public class DetailService {

    private static DetailDAO detailDAO;

    public DetailService() {
        detailDAO = new DetailDAO();
    }

    public void persist(Detail entity) {
        detailDAO.openCurrentSessionWithTransaction();
        detailDAO.persist(entity);
        detailDAO.closeCurrentSessionWithTransaction();
    }

    public void update(Detail entity) {
        detailDAO.openCurrentSessionWithTransaction();
        detailDAO.update(entity);
        detailDAO.closeCurrentSessionWithTransaction();
    }

    public Detail findById(String id) {
        detailDAO.openCurrentSession();
        Detail detail = detailDAO.findById(id);
        detailDAO.closeCurrentSession();
        return detail;
    }

    public void delete(String id) {
        detailDAO.openCurrentSessionWithTransaction();
        Detail detail = detailDAO.findById(id);
        detailDAO.delete(detail);
        detailDAO.closeCurrentSessionWithTransaction();
    }

    public void delete(Detail detail) {
        detailDAO.openCurrentSessionWithTransaction();
        detailDAO.delete(detail);
        detailDAO.closeCurrentSessionWithTransaction();
    }

    public List<Detail> findAll() {
        detailDAO.openCurrentSession();
        List<Detail> details = detailDAO.findAll();
        detailDAO.closeCurrentSession();
        return details;
    }

    public void deleteAll() {
        detailDAO.openCurrentSessionWithTransaction();
        detailDAO.deleteAll();
        detailDAO.closeCurrentSessionWithTransaction();
    }

    public DetailDAO detailDAO() {
        return detailDAO;
    }
}