class Shipper {
    private _name: String;
    private _id: String;
    private _email: String;
    private _pwd: String;

    constructor(name: String, id: String, email: String, pwd: String) {
        this._name = name;
        this._id = id;
        this._email = email;
        this._pwd = pwd

    }

    get email(): String {
        return this._email;
    }

    set email(value: String) {
        this._email = value;
    }

    get pwd(): String {
        return this._pwd;
    }

    set pwd(value: String) {
        this._pwd = value;
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

export default Shipper;