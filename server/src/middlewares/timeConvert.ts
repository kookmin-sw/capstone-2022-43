const dateToUnix = (obj: any, params: string[]) => {
    try {
        params.forEach((param) => {
            obj[param] = ~~(new Date(obj[param]).getTime() / 1000);
        });
    } catch (err) {
        console.log("Fail to convert timestamp to unix", err);
    }
}

const unixToDate = (obj: any, params: string[]) => {
    try {
        params.forEach((param) => {
            obj[param] = new Date(obj[param] * 1000);
        });
    } catch (err) {
        console.log("Fail to convert unix to timestamp", err);
    }
}

export { dateToUnix, unixToDate };