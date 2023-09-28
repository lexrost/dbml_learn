create table public.users (
    id int not null 
    , first_name varchar
    , last_name varchar     
    , created_at TIMESTAMP  
    , updated_at TIMESTAMP  
    , user_pic_link varchar 
    , email varchar         
    , telephone varchar     
    , password_hash varchar 
    , primary key(id)
) 
; 
comment on table public.users is 'list of users registered within our system';
comment on column public.users.id is 'unique id of a user';
comment on column public.users.first_name is 'first name of a user ';
comment on column public.users.last_name is 'last name of a user';
comment on column public.users.created_at is 'datetime of users id created within db';
comment on column public.users.updated_at is 'datetime of user record was updated within db';
comment on column public.users.user_pic_link is 'a url of the userpic that was updated by user';
comment on column public.users.email is 'emails of users they submitted during registration. were checked by double opt in process';
comment on column public.users.telephone is 'phone number users submitted during registration. were checked by double opt in process';
comment on column public.users.password_hash is 'hash of the password that user used during registration' ;

create table public.merchant (
    id int not null PRIMARY KEY 
    , name varchar not null 
    , create_at timestamp 
    , updated_at timestamp
    , deck_rank varchar 
) 

create table public.vendors ( 
      id varchar not null                          
    , created_at TIMESTAMP              
    , updated_at TIMESTAMP              
    , name varchar                      
    , contract_id varchar               
    , default_contact_person_id varchar 
    , primary key(id)
    , foreign key(default_contact_person_id) REFERENCES users (id) 
    -- , foreign key(contract_id) REFERENCES contracts(id) 
    )
comment on table vendors is 'list of products registered within our sytem' ;
comment on column vendors.id is 'unique id of a vendor';
comment on column vendors.created_at is 'datetime of vendors id created within db';
comment on column vendors.updated_at is 'datetime of vendors record was updated within db';
comment on column vendors.name is 'name of the vendor';
comment on column vendors.contract_id is 'id of the first contract signed with vendor';
comment on column vendors.default_contact_person_id is 'id of the default contact person for vendor.';


create table contracts (
    id int not null PRIMARY KEY 
    , merchant_id int 
    , create_at timestamp
    , updated_at timestamp
    , delivery_fee numeric
    , pickup_fee numeric 
    , tablet_fee numeric 
    , pictures_fee numeric 
    , starts_at timestamp
    , expires_at timestamp 
    , signed_at timestamp 
    , signed_by int 
    , auto_renewal_term boolean  
    , signed_contract_link varchar
    , contract_template_id int
    , foreign key(merchant_id) REFERENCES merchant(id)
) 
comment on table vendors is 'list of contracts with merchants signed and drafts' ;
comment on column contracts.merchant_id is 'merchant uninque idetifier points to merchant.id ';
comment on column contracts.create_at is 'timestamp when draft was created in the system';
comment on column contracts.updated_at is 'timestamp when this row was updated';
comment on column contracts.delivery_fee is 'percent of order that should be paid to wolt for deliveries';
comment on column contracts.pickup_fee is 'percent of order that should be paid paid to wolt for pickups';
comment on column contracts.tablet_fee is 'amount of euro that should be paid paid to wolt for providing tablet';
comment on column contracts.pictures_fee is 'amount of euro that should be paid paid to wolt for providing photoshoot service';
comment on column contracts.starts_at is 'timestamp when contract starts';
comment on column contracts.expires_at is 'timestamp when contract should end';
comment on column contracts.signed_at is 'timestamp when contract was signed by both parties wolt and merchant';
comment on column contracts.signed_by is 'link to user id that has signed the conrtact on behalf of partner';
comment on column contracts.auto_renewal_term is 'if contract has a auto renewal term';
comment on column contracts.signed_contract_link is 'url to photocopy of the contract or esigned versions of the contract';
comment on column contracts.contract_template_id is 'link to template this contract is based on';

create table if not exists products ( 
    id varchar comment 'unique id of a product'
    , created_at TIMESTAMP  comment 'datetime of users id created within db'
    , updated_at TIMESTAMP comment 'datetime of product record was updated within db'
    , name varchar comment 'name of the product'
    , vendor_id varchar comment 'id of the vendor that produces the product'
    , default_variant_id varchar comment 'default sku for the product'
    , primary key (id)
    , foreign key (default_variant_id) REFERENCES product_variants.id 
    , foreign key (vendor_id) REFERENCES vendors.id 
    )
comment = 'list of products registered within our sytem'
; 

-- pipedrive domain / onboarding 
create table deals (
    id int 
    , created_at timestamp
    , updated_at timestamp 
    , owner int 
    , organization int 
    , contact int 
    , deal_stage 
    , deal_enter_stage_at 
    , funnel_id int 
    , 
); 

-- create table deals_event_log (
--     id varchar 
--     , created_at timestamp
--     , deal_id int 
--     , mesage  json 
-- );

-- create table deals_owners (
--     id varchar 
--     , wolt_id int 
--     , email 
--     , name 
-- )

-- create table deals_attributes (
--     id 
--     , account 
--     , name 
--     , some_stuff  
-- ) 
