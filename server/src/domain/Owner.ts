import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('OWNER')
export default class Owner {
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

    @Column('datetime', { default: () => "CURRENT_TIMESTAMP" })
    public created_at?: number;

    constructor(name: string, phone_number: string, email: string, password: string) {
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.password = password;
    }
}