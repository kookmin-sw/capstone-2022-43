import { Entity, PrimaryGeneratedColumn, Column, Binary } from "typeorm"


@Entity('FORWARDER')
export default class Forwarder {
    @PrimaryGeneratedColumn('uuid')
    public uuid?: string;

    @Column('varchar', { length: 45 })
    public name: string;

    @Column('varchar', { length: 45 })
    public phone_number: string;

    @Column('varchar', { unique: true, length: 45 })
    public email: string;

    @Column('varchar', { length: 80 })
    public password: string;

    @Column('varchar', { length: 45 })
    public corporation_name: string;

    @Column('varchar', { length: 45 })
    public corporation_number: string;

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: number;

    constructor(name: string, phone_number: string, email: string, password: string, corporation_name: string, corporation_num: string) {
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.password = password;
        this.corporation_name = corporation_name;
        this.corporation_number = corporation_num;
    }

}