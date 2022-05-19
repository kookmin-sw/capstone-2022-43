import { Entity, PrimaryGeneratedColumn, Column, BaseEntity, OneToMany } from "typeorm"
import Quotation from "./Quotation";
import Review from "./Review";


@Entity('FORWARDER')
export default class Forwarder extends BaseEntity {
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

    @Column('varchar', { length: 45 })
    public corporation_name?: string;

    @Column('varchar', { length: 45 })
    public corporation_number?: string;

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: Date;

    @OneToMany((type) => Quotation, quotation => quotation.forwarder)
    public quotations?: Quotation[];

    @OneToMany((type) => Review, review => review.forwarder)
    public reviews?: Review[];
};