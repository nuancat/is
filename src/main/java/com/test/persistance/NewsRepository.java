package com.test.persistance;

import com.test.model.News;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by shamilbikchentaev on 13.05.17.
 */
@Document(collection = "news")
public interface NewsRepository extends MongoRepository<News, String> {
}
