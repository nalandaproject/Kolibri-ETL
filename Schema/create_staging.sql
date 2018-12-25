DROP DATABASE IF EXISTS staging_2schools;
CREATE DATABASE staging_2schools;
use staging_2schools;
CREATE TABLE content_contentnode (id char(32) NOT NULL PRIMARY KEY, title varchar(200) NOT NULL, content_id char(32) NOT NULL, channel_id char(32) NOT NULL, description text NULL, sort_order real NULL, license_owner varchar(200) NOT NULL, author varchar(200) NOT NULL, kind varchar(200) NOT NULL, available bool NOT NULL, stemmed_metaphone varchar(1800) NOT NULL, lft integer unsigned NOT NULL, rght integer unsigned NOT NULL, tree_id integer unsigned NOT NULL, level integer unsigned NOT NULL, lang_id varchar(14) NULL REFERENCES content_language (id), license_name varchar(50) NULL, license_description text NULL, parent_id char(32) NULL REFERENCES content_contentnode (id));
CREATE TABLE content_assessmentmetadata (id char(32) NOT NULL PRIMARY KEY, assessment_item_ids text NOT NULL, number_of_assessments integer NOT NULL, mastery_model text NOT NULL, randomize bool NOT NULL, is_manipulable bool NOT NULL, contentnode_id char(32) NOT NULL REFERENCES content_contentnode (id));
CREATE TABLE kolibriauth_facilitydataset (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, description text NOT NULL, location varchar(200) NOT NULL, learner_can_edit_username bool NOT NULL, learner_can_edit_name bool NOT NULL, learner_can_edit_password bool NOT NULL, learner_can_sign_up bool NOT NULL, learner_can_delete_account bool NOT NULL, learner_can_login_with_no_password bool NOT NULL, preset varchar(50) NOT NULL, show_download_button_in_learn bool NOT NULL);
CREATE TABLE kolibriauth_collection (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, name varchar(100) NOT NULL, lft integer unsigned NOT NULL, rght integer unsigned NOT NULL, tree_id integer unsigned NOT NULL, level integer unsigned NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), kind varchar(20) NOT NULL,parent_id char(32) NULL REFERENCES kolibriauth_collection (id));
CREATE TABLE kolibriauth_role (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, collection_id char(32) NOT NULL REFERENCES kolibriauth_collection (id), dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), kind varchar(26) NOT NULL);
CREATE TABLE kolibriauth_membership (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, collection_id char(32) NOT NULL REFERENCES kolibriauth_collection (id), dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id));
CREATE TABLE kolibriauth_facilityuser (password varchar(128) NOT NULL, last_login datetime NULL, id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, full_name varchar(120) NOT NULL, date_joined varchar(200) NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), facility_id char(32) NOT NULL REFERENCES kolibriauth_collection (id), username varchar(30) NOT NULL);
CREATE TABLE logger_contentsessionlog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, content_id char(32) NOT NULL, channel_id char(32) NOT NULL, end_timestamp varchar(200) NULL, time_spent real NOT NULL, progress real NOT NULL, kind varchar(200) NOT NULL, extra_fields text NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), user_id char(32) NULL REFERENCES kolibriauth_facilityuser (id), start_timestamp varchar(200) NOT NULL);
CREATE TABLE logger_contentsummarylog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, content_id char(32) NOT NULL, channel_id char(32) NOT NULL, end_timestamp varchar(200) NULL, completion_timestamp varchar(200) NULL, time_spent real NOT NULL, progress real NOT NULL, kind varchar(200) NOT NULL, extra_fields text NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), start_timestamp varchar(200) NOT NULL);
CREATE TABLE logger_masterylog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, mastery_criterion text NOT NULL, end_timestamp varchar(200) NULL, completion_timestamp varchar(200) NULL, mastery_level integer NOT NULL, complete bool NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), summarylog_id char(32) NOT NULL REFERENCES logger_contentsummarylog (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), start_timestamp varchar(200) NOT NULL);
CREATE TABLE logger_attemptlog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, item varchar(200) NOT NULL,  end_timestamp varchar(200) NOT NULL, completion_timestamp varchar(200) NULL, time_spent real NOT NULL, complete bool NOT NULL, correct real NOT NULL, hinted bool NOT NULL, answer text NULL, simple_answer varchar(200) NOT NULL, interaction_history longtext NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), masterylog_id char(32) NULL REFERENCES logger_masterylog (id), sessionlog_id char(32) NOT NULL REFERENCES logger_contentsessionlog (id), user_id char(32) NULL REFERENCES kolibriauth_facilityuser (id), start_timestamp varchar(200) NOT NULL);
CREATE TABLE logger_usersessionlog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, channels text NOT NULL, start_timestamp varchar(200) NOT NULL, pages text NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), last_interaction_timestamp varchar(200) NULL);
CREATE TABLE lessons_lesson (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, title varchar(50) NOT NULL, description varchar(50) NOT NULL, resources text NOT NULL, is_active bool NOT NULL, collection_id char(32) NOT NULL REFERENCES kolibriauth_collection (id), created_by_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), date_created varchar(200) NOT NULL);
CREATE TABLE exams_exam (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, title varchar(200) NOT NULL, channel_id varchar(32) NOT NULL, question_count integer NOT NULL, question_sources text NOT NULL, seed integer NOT NULL, active bool NOT NULL, archive bool NOT NULL, collection_id char(32) NOT NULL REFERENCES kolibriauth_collection (id), creator_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id));
CREATE TABLE logger_examlog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, closed bool NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), exam_id char(32) NOT NULL REFERENCES exams_exam (id), user_id char(32) NOT NULL REFERENCES kolibriauth_facilityuser (id), completion_timestamp varchar(200) NULL);
CREATE TABLE logger_examattemptlog (id char(32) NOT NULL PRIMARY KEY, _morango_dirty_bit bool NOT NULL, _morango_source_id varchar(96) NOT NULL, _morango_partition varchar(128) NOT NULL, item varchar(200) NOT NULL, end_timestamp varchar(200) NOT NULL, completion_timestamp varchar(200) NULL, time_spent real NOT NULL, complete bool NOT NULL, correct real NOT NULL, hinted bool NOT NULL, answer text NULL, simple_answer varchar(200) NOT NULL, interaction_history text NOT NULL, content_id char(32) NOT NULL, channel_id char(32) NOT NULL, dataset_id char(32) NOT NULL REFERENCES kolibriauth_facilitydataset (id), examlog_id char(32) NOT NULL REFERENCES logger_examlog (id), user_id char(32) NULL REFERENCES kolibriauth_facilityuser (id), start_timestamp varchar(200) NOT NULL);
CREATE TABLE facility_city (city_id int(11) DEFAULT NULL, city_name varchar(32) DEFAULT NULL, city_initial char(2) DEFAULT NULL);
INSERT INTO facility_city (city_id,city_name,city_initial) VALUES (1, 'Pune','P'), (2, 'Mumbai','M'), (3, 'Delhi','D'), (4, 'Rajsthan','R'), (5, 'Samples','S');
