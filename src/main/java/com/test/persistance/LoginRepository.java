package com.test.persistance;



import com.test.model.Login;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface LoginRepository extends MongoRepository<Login, String> {
         Login findByLoginAndPassword(String login, String password);
         Login findByLogin(String login);
         Login save (Login login);
         void deleteAllByLogin(String login);
         Login findByToken(String token);
         Login insert(Login login);
         Login findById(String id);
}
