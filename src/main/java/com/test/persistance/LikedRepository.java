package com.test.persistance;

import com.test.model.Liked;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by shamilbikchentaev on 13.05.17.
 */
@Document(collection = "liked")
public interface LikedRepository extends MongoRepository<Liked,String>{
    Iterable<Liked> findAllByUserId(String userId);
    Liked save(Liked liked);
    Liked findByBookmarkId(String bookmarkID);
    Integer countByUserId(String userId);
}
