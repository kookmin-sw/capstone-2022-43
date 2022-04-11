import winston, { format } from 'winston';
import winstonDaily from 'winston-daily-rotate-file';
const { combine, timestamp, label, printf, colorize } = winston.format;

const logFormat = printf(({ timestamp, message, level, label }): string => {
    return `${ timestamp } - ${ level }: [${ label }] ${ message }`;
});
const options = {
    console: {
        level: 'info',
        format: combine(
            label({ label: 'baetaverse' }),
            timestamp({ format: 'YYYY-MM-DD HH:mm:ss.ms' }),
            colorize(),
            logFormat
        )
    }
}

const logger = winston.createLogger({
    format: combine(
        timestamp({
            format: 'YYYY-MM-DD HH:mm:ss',

        }),
        colorize(),
        format.label({ label: 'baetaverse' }),
        logFormat,
    ),
    transports: [
        new winston.transports.Console({
            format: logFormat,

        })
        // new winstonDaily({ //error, warn, info 모두 남김
        //     level:'info',
        //     datePattern: 'YYYY-MM-DD',
        //     dirname: 'logs',
        //     filename: '%DATE%.log',
        //     maxFiles: '30d',
        //     zippedArchive: true,
        // }),
        //
        // new winstonDaily({//error 로그만 남김
        //     level:'error',
        //     datePattern: 'YYYY-MM-DD',
        //     dirname: 'logs/error',
        //     filename: '%DATE%_ERROR.log',
        //     maxFiles: '30d',
        //     zippedArchive: true,
        // }),
    ],
});

// if (process.env.NODE_ENV !== 'production') {
//     logger.add(new winston.transports.Console(options.console)); // 개발 시 console로도 출력
// }

export default logger;
