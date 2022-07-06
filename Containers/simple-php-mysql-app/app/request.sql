use MY_DATABASE;
drop table if exists `students`;
create table `students` (
    id int not null auto_increment,
    nom text not null,
    prenom text not null,
    matricule text not null,
    primary key (id)
);
insert into `students` (nom, prenom,matricule) values
    ("Ndiaye","Abdel","1234"),
    ("Faye","Modou","4321"),
    ("Sall","Aminata","3241");