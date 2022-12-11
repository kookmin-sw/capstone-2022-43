import { BaseEntity, Column, Entity, PrimaryColumn } from "typeorm";


@Entity('ADMIN')
export default class Admin extends BaseEntity {
    @PrimaryColumn('varchar', { unique: true, length: 45 })
    email!: string;

    @Column('varchar', { length: 80 })
    password!: string;

    @Column('simple-enum')
    role!: 'admin' | 'restricted';
};