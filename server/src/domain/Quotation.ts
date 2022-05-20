import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    BaseEntity,
    ManyToOne,
    JoinColumn,
    OneToOne
} from 'typeorm';
import Request from "./Request";
import Forwarder from "./Forwarder";
import Review from "./Review";


@Entity('QUOTATION')
export default class Quotation extends BaseEntity {
    @PrimaryGeneratedColumn('increment')
    public id?: number;

    @Column('int')
    public ocean_freight_price?: number;

    @Column('int')
    public inland_freight_price?: number;

    @Column('int')
    public total_price?: number;

    @Column('datetime')
    public estimated_time?: Date;

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: Date;

    @Column('int')
    public request_id?: number;

    @Column('uuid')
    public forwarder_uuid?: string;

    @ManyToOne((type) => Forwarder, (forwarder) => forwarder.quotations)
    @JoinColumn({ name: 'forwarder_uuid', referencedColumnName: 'uuid' })
    public forwarder?: Forwarder;

    @ManyToOne((type) => Request, (request) => request.quotations)
    @JoinColumn({ name: 'request_id', referencedColumnName: 'id' })
    public requests?: Request;

    @OneToOne((type) => Review, review => review.quotation)
    public review?: Review;
};
