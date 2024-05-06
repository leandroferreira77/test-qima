INSERT INTO `role` (id_role, name) VALUES(1, 'ROLE_ADMIN');
INSERT INTO `role` (id_role, name) VALUES(2, 'ROLE_USER');

INSERT INTO `user` (id, name, password, status_user, username) VALUES(1, 'ADMINISTRATOR', '$2a$10$.M21F4qrIPHSZEWT9UWRH.VQosqkPt1uZkV7bFR8JIxgqD4K7ttKa', '1', 'admin@qima.com');
INSERT INTO `user` (id, name, password, status_user, username) VALUES(2, 'USER', '$2a$10$LmAxvV1es.Wq.9L6gOJ2YeIqodigBEmX2pkEZ1Xqv/IBku9BTVozS', '1', 'user@qima.com');

INSERT INTO user_role (user_id, role_id) VALUES(1, 1);
INSERT INTO user_role (user_id, role_id) VALUES(2, 2);

INSERT INTO category (id, name) VALUES(1, 'DRINKS');
INSERT INTO category (id, name) VALUES(2, 'FOODS');
INSERT INTO category (id, name) VALUES(3, 'SNACKS');