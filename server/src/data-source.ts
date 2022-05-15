import { DataSource } from "typeorm";
import { Forwarder, Owner } from "./domain";


const dataSource = new DataSource({
    type: 'mysql',
    host: process.env.MYSQL_SERVER_HOST,
    port: Number(process.env.MYSQL_SERVER_PORT),
    username: process.env.MYSQL_SERVER_USER,
    password: process.env.MYSQL_SERVER_PASSWORD,
    database: 'BAETAVERSE',
    entities: [Owner, Forwarder],
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