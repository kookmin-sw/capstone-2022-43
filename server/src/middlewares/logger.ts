import winston, { format } from 'winston';

const { combine, timestamp, label, printf, colorize } = winston.format;

const myFormat = printf(({ timestamp, message, level, label }): string => {
    return `${ timestamp } - ${ level }: [${ label }] ${ message }`;
});
const options = {
    file: {
        level: 'silly',
        filename: `logs/winston-test.log`, // 로그파일을 남길 경로
        format: format.combine(
            format.label({ label: 'winston-test' }),
            format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
            myFormat    // log 출력 포맷
        )
    },
    console: {
        level: 'silly',
        format: combine(
            label({ label: 'nba_express' }),
            timestamp({ format: 'YYYY-MM-DD HH:mm:ss.ms' }),
            colorize(),
            myFormat
        )
    }
}

const logger = winston.createLogger({
    transports: [
        new winston.transports.File(options.file)
    ],
});

if (process.env.NODE_ENV !== 'production') {
    logger.add(new winston.transports.Console(options.console)); // 개발 시 console로도 출력
}

export default logger;
