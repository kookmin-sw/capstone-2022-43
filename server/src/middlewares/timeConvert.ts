const isoToUnix = (obj: any, params: string[]) => {
    try {
        params.forEach((param) => {
            obj[param] = ~~(new Date(obj[param]).getTime() / 1000);
        });
    } catch (err) {
        console.log("Fail to convert iso to unix", err);
    }
}

const unixToIso = (obj: any, params: string[]) => {
    try {
        params.forEach((param) => {
            obj[param] = new Date(obj[param] * 1000).toISOString();
        });
    } catch (err) {
        console.log("Fail to convert unix to iso", err);
    }
}

export { isoToUnix, unixToIso };