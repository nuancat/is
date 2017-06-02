package com.test.persistance;

import com.test.model.Friendship;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by shamilbikchentaev on 13.05.17.
 */
public interface FriendshipRepository extends MongoRepository<Friendship, String> {
    Friendship save(Friendship friendship);
    Iterable<Friendship> findAllByTargetIdAndHandshake(String targetId, Boolean handshake);
    Iterable<Friendship> findAllByInitiatorIdAndHandshake(String initiatorId, Boolean handshake);
    Friendship findByInitiatorIdAndTargetId(String initiatorId, String targetId);
    void deleteByInitiatorIdAndTargetId(String initiatorId, String targetId);
    Integer countByInitiatorIdAndHandshake(String initiatorId, Boolean handshake);
}
