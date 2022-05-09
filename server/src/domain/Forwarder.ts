class Forwarder {
    private _name: String;
    private _id: String;

    constructor(name: String, id: String) {
        this._name = name;
        this._id = id;

    }

    get name(): String {
        return this._name;
    }

    set name(value: String) {
        this._name = value;
    }

    get id(): String {
        return this._id;
    }

    set id(value: String) {
        this._id = value;
    }
}

export default Forwarder;