import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    BaseEntity,
    ManyToOne,
    OneToMany,
    JoinColumn,
    OneToOne
} from 'typeorm';
import Forwarder from "./Forwarder";
import Request from "./Request";
import Quotation from "./Quotation";
import Owner from "./Owner";


@Entity('REVIEW')
export default class Review extends BaseEntity {
    @PrimaryGeneratedColumn('increment')
    public id?: number;

    @Column('tinyint')
    public score?: number;

    @Column('text')
    public message?: string;

    @Column('datetime', { default: () => 'CURRENT_TIMESTAMP' })
    public created_at?: Date;

    @Column('int')
    public request_id?: number;

    @Column('int')
    public quotation_id?: number;

    @Column('uuid')
    public owner_uuid?: string;

    @Column('uuid')
    public forwarder_uuid?: string;

    @ManyToOne((type) => Forwarder, (forwarder) => forwarder.reviews)
    @JoinColumn({ name: 'forwarder_uuid', referencedColumnName: 'uuid' })
    public forwarder?: Forwarder;


    @ManyToOne((type) => Owner, (owner) => owner.reviews)
    @JoinColumn({ name: 'owner_uuid', referencedColumnName: 'uuid' })
    public owner?: Owner;

    @OneToOne((type) => Request, (request) => request.review)
    @JoinColumn({ name: 'request_id', referencedColumnName: 'id' })
    public requests?: Request;

    @OneToOne((type) => Quotation, (quotation) => quotation.review)
    @JoinColumn({ name: 'quotation_id', referencedColumnName: 'id' })
    public quotation?: Quotation;
};