import {Column, CreateDateColumn, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import Forwarder from "./Forwarder";
import {type} from "os";

@Entity("QUOTATION")
export class Quotation {
    @PrimaryGeneratedColumn('increment')
    id: number;

    @Column()
    ocean_freight_price: number;

    @Column({nullable: true})
    inland_freight_price: number;

    @Column()
    total_price: number;

    @Column()
    estimated_time: number;

    @ManyToOne((type) => Forwarder, (forwarder) => forwarder.uuid)
    forwarder_uuid: string;

    @Column()
    request_id: number;

    @CreateDateColumn()
    created_at?: Date;

    constructor(id: number, ocean_freight_price: number, inland_freight_price: number, total_price: number, estimated_time: number ,forwarder_uuid: string, request_id: number) {
        this.id = id;
        this.ocean_freight_price = ocean_freight_price;
        this.inland_freight_price = inland_freight_price;
        this.total_price = total_price;
        this.estimated_time = estimated_time;
        this.forwarder_uuid = forwarder_uuid;
        this.request_id = request_id;
    }



}