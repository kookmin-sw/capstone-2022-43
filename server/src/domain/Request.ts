import { Entity, PrimaryGeneratedColumn, Column, BaseEntity, OneToMany, OneToOne } from 'typeorm';
import Goods from "./Goods";
import Quotation from "./Quotation";
import Review from "./Review";


@Entity('REQUEST')
export default class Request extends BaseEntity {
    @PrimaryGeneratedColumn('increment')
    public id?: number;

    @Column('varchar', { length: 45 })
    public trade_type?: string;

    @Column('varchar', { length: 45 })
    public trade_detail?: string;

    @Column('datetime')
    public forwarding_date?: Date;

    @Column('varchar', { length: 45 })
    public departure_country?: string;

    @Column('varchar', { length: 45 })
    public departure_detail?: string;

    @Column('varchar', { length: 45 })
    public destination_country?: string;

    @Column('varchar', { length: 45 })
    public destination_detail?: string;

    @Column('varchar', { length: 45 })
    public incoterms?: string;

    @Column('datetime')
    public closing_date?: Date;

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: Date;

    @Column('uuid')
    public owner_uuid?: string;

    @OneToMany((type) => Goods, goods => goods.request)
    public goods_array?: Goods[];

    @OneToMany((type) => Quotation, quotation => quotation.requests)
    public quotations?: Quotation[];

    @OneToOne((type) => Review, review => review.requests)
    public review?: Review;
};