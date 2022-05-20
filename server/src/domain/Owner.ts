import { Entity, PrimaryGeneratedColumn, Column, OneToMany, BaseEntity } from 'typeorm';
import Review from "./Review";

@Entity('OWNER')
export default class Owner extends BaseEntity{
    @PrimaryGeneratedColumn('uuid')
    public uuid?: string;

    @Column('varchar', { length: 45 })
    public name?: string;

    @Column('varchar', { length: 45 })
    public phone_number?: string;

    @Column('varchar', { unique: true, length: 45 })
    public email?: string;

    @Column('varchar', { length: 80 })
    public password?: string;

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: Date;

    @OneToMany((type) => Review, review => review.owner)
    public reviews?: Review[];
};