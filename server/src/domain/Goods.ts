import { Entity, PrimaryGeneratedColumn, Column, BaseEntity, ManyToOne, JoinColumn } from 'typeorm';
import Request from "./Request";


@Entity('GOODS')
export default class Goods extends BaseEntity {
    @PrimaryGeneratedColumn('increment')
    public id?: number;

    @Column('varchar', { length: 45 })
    public name?: string;

    @Column('int')
    public price?: number;

    @Column('int')
    public weight?: number;

    @Column('varchar', { length: 45 })
    public standard_unit?: string;

    @Column('varchar', { length: 45 })
    public hscode?: string;

    @Column('timestamp', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: Date;

    @Column('int')
    public request_id?: number;

    @ManyToOne((type) => Request, request => request.goods_array)
    @JoinColumn({ name: 'request_id', referencedColumnName: 'id' })
    public request?: Request
};