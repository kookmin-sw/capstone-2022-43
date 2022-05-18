import { DataSource } from "typeorm";
import Owner from "./domain/Owner";
import Forwarder from "./domain/Forwarder";
import Request from "./domain/Request";
import Goods from "./domain/Goods";
import Quotation from "./domain/Quotation";
import Review from "./domain/Review";


const dataSource = new DataSource({
    type: 'mysql',
    host: process.env.MYSQL_SERVER_HOST,
    port: Number(process.env.MYSQL_SERVER_PORT),
    username: process.env.MYSQL_SERVER_USER,
    password: process.env.MYSQL_SERVER_PASSWORD,
    database: 'BAETAVERSE',
    entities: [Owner, Forwarder, Request, Goods, Quotation, Review],
    synchronize: true,
    logging: false,
});

export default dataSource;

/*
supportedDataTypes: [
    'bit',                'int',             'integer',
    'tinyint',            'smallint',        'mediumint',
    'bigint',             'float',           'double',
    'double precision',   'real',            'decimal',
    'dec',                'numeric',         'fixed',
    'bool',               'boolean',         'date',
    'datetime',           'timestamp',       'time',
    'year',               'char',            'nchar',
    'national char',      'varchar',         'nvarchar',
    'national varchar',   'blob',            'text',
    'tinyblob',           'tinytext',        'mediumblob',
    'mediumtext',         'longblob',        'longtext',
    'enum',               'set',             'binary',
    'varbinary',          'json',            'geometry',
    'point',              'linestring',      'polygon',
    'multipoint',         'multilinestring', 'multipolygon',
    'geometrycollection'
]
*/