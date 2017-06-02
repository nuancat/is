package com.test.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by shamilbikchentaev on 13.05.17.
 */
@Document (collection = "friendship")
public class Friendship {
    @Id private String id;
    private String initiatorId;
    private String targetId;
    private Boolean handshake;

    public Friendship(String initiatorId, String targetId, Boolean handshake) {
        this.initiatorId = initiatorId;
        this.targetId = targetId;
        this.handshake = handshake;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInitiatorId() {
        return initiatorId;
    }

    public void setInitiatorId(String initiatorId) {
        this.initiatorId = initiatorId;
    }

    public String getTargetId() {
        return targetId;
    }

    public void setTargetId(String targetId) {
        this.targetId = targetId;
    }

    public Boolean getHandshake() {
        return handshake;
    }

    public void setHandshake(Boolean handshake) {
        this.handshake = handshake;
    }
}
