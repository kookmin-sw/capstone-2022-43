import SwaggerJsdoc from 'swagger-jsdoc';


const schemas = {
    APIResponse: {
        type: 'object',
        properties: {
            status: {
                type: 'number',
                description: 'Status code',
                default: '200 | 404 | 500'
            },
            message: {
                type: 'string',
                description: 'Description about response'
            },
        }
    },
    Owner: {
        type: 'object',
        properties: {
            uuid: {
                type: 'string',
                format: 'uuid',
                description: 'PrimaryGeneratedColumn'
            },
            email: {
                type: 'string',
                format: 'varchar(45)',
                description: 'unique'
            },
            password: {
                type: 'string',
                format: 'varchar(80)',
            },
            name: {
                type: 'string',
                format: 'varchar(45)'
            },
            phone_number: {
                type: 'string',
                format: 'varchar(45)',
            },
            created_at: {
                type: 'number',
                format: 'datetime',
                default: 'CURRENT_TIMESTAMP'
            },
        },
    },
    Forwarder: {
        type: 'object',
        properties: {
            uuid: {
                type: 'string',
                format: 'uuid',
                description: 'PrimaryGeneratedColumn'
            },
            email: {
                type: 'string',
                format: 'varchar(45)',
                description: 'unique'
            },
            password: {
                type: 'string',
                format: 'varchar(80)',
            },
            name: {
                type: 'string',
                format: 'varchar(45)'
            },
            phone_number: {
                type: 'string',
                format: 'varchar(45)',
            },
            corporation_name: {
                type: 'string',
                format: 'varchar(45)',
            },
            corporation_number: {
                type: 'string',
                format: 'varchar(45)',
            },
            created_at: {
                type: 'number',
                format: 'datetime',
                default: 'CURRENT_TIMESTAMP'
            },
        },
    },
    Request: {
        type: 'object',
        properties: {
            id: {
                type: 'number',
                format: 'increment',
                description: 'PrimaryGeneratedColumn'
            },
            product_name: {
                type: 'string',
                format: 'varchar(45)',
            },
            product_price: {
                type: 'number',
                format: 'int',
            },
            product_weight: {
                type: 'number',
                format: 'int',
            },
            standard_unit: {
                type: 'string',
                format: 'varchar(45)',
            },
            hscode: {
                type: 'string',
                format: 'varchar(45)',
            },
            trade_type: {
                type: 'string',
                format: 'varchar(45)',
            },
            trade_detail: {
                type: 'string',
                format: 'varchar(45)',
            },
            forwarding_date: {
                type: 'number',
                format: 'datetime'
            },
            departure_country: {
                type: 'string',
                format: 'varchar(45)',
            },
            departure_detail: {
                type: 'string',
                format: 'varchar(45)',
            },
            destination_country: {
                type: 'string',
                format: 'varchar(45)',
            },
            destination_detail: {
                type: 'string',
                format: 'varchar(45)',
            },
            incoterms: {
                type: 'string',
                format: 'varchar(45)',
            },
            closing_date: {
                type: 'number',
                format: 'datetime',
            },
            created_at: {
                type: 'number',
                format: 'datetime',
                default: 'CURRENT_TIMESTAMP'
            },
            owner_uuid: {
                type: 'string',
                format: 'uuid',
                description: 'FK from Owner'
            },
        },
    },

    Quotation: {
        type: 'object',
        properties: {
            id: {
                type: 'number',
                format: 'increment',
                description: 'PrimaryGeneratedColumn'
            },
            ocean_freight_price: {
                type: 'number',
                format: 'int',
            },
            inland_freight_price: {
                type: 'number',
                format: 'int',
            },
            total_price: {
                type: 'number',
                format: 'int',
            },
            estimated_time: {
                type: 'number',
                format: 'datetime'
            },
            created_at: {
                type: 'number',
                format: 'datetime',
                default: 'CURRENT_TIMESTAMP'
            },
            request_id: {
                type: 'number',
                format: 'int',
                description: 'FK from Request'
            },
            forwarder_uuid: {
                type: 'string',
                format: 'uuid',
                description: 'FK from Forwarder'
            },
        },
    },
    Review: {
        type: 'object',
        properties: {
            id: {
                type: 'number',
                format: 'increment',
                description: 'PrimaryGeneratedColumn'
            },
            score: {
                type: 'number',
                format: 'tinyint',
            },
            message: {
                type: 'string',
                format: 'text',
            },
            created_at: {
                type: 'number',
                format: 'datetime',
                default: 'CURRENT_TIMESTAMP'
            },
            request_id: {
                type: 'number',
                format: 'int',
                description: 'FK from Request'
            },
            quotation_id: {
                type: 'number',
                format: 'int',
                description: 'FK from Quotation'
            },
            owner_uuid: {
                type: 'string',
                format: 'uuid',
                description: 'FK from Owner'
            },
            forwarder_uuid: {
                type: 'string',
                format: 'uuid',
                description: 'FK from Forwarder'
            },
        },
    },
};

const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        version: "1.0.0", // Version (required)
        title: "REST API documentation", // Title (required)
        description: "Description of BATAVERSE API Server",
        contact: {
            name: 'About BAETAVERSE',
            url: "https://kookmin-sw.github.io/capstone-2022-43/"
        },
        termsOfService: 'https://github.com/kookmin-sw/capstone-2022-43',
        license: {
            name: 'See on github wiki',
            url: "https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BServer%5D-REST-API-Documents"
        },
    },
    servers: [
        {
            url: 'http://rest.baetaverse.com',
            description: 'Deployment'
        },
        {
            url: 'http://localhost:' + process.env.PORT,
            description: 'Development',
        },
    ],
    components: {
        securitySchemes: {
            OwnerToken: {
                type: 'http',
                scheme: 'bearer',
                bearerFormat: 'JWT'
            },
            ForwarderToken: {
                type: 'http',
                scheme: 'bearer',
                bearerFormat: 'JWT'
            }
        },
        schemas
    },
    security: [
        {
            OwnerToken: [],
            ForwarderToken: []
        }
    ],
    tags: [
        {
            name: '/',
            description: 'Simple index routes',
        },
        {
            name: '/api/auth',
            description: 'API for User Authorization'
        },
        {
            name: '/api/hscode',
            description: 'API for HSCode recommendation',
            // externalDocs: {
            //     description: 'Server works as proxy'
            // }
        },
        {
            name: '/api/requests',
            description: 'API for quote request'
        },
        {
            name: '/api/quotations',
            description: 'API for quotation about Owner\'s request'
        },
        {
            name: '/api/reviews',
            description: 'API for review matched with request and quotation'
        }
    ]
};

const swaggerOptions = {
    swaggerDefinition,
    apis: ['./src/routes/**/**.ts'],
};


export default SwaggerJsdoc(swaggerOptions);