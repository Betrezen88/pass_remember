.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

function getDatabase() {
    return Sql.LocalStorage.openDatabaseSync("PassRemember", "1.0", "Database", 100000);
}

function createDatabase() {
    console.log("createDatabase()");
    var db = getDatabase();

    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS category (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS account (id INTEGER PRIMARY KEY AUTOINCREMENT, login TEXT, password TEXT, source TEXT, description TEXT, categoryId INTEGER);');
        }
    )
}

function addCategory(catName) {
    console.log("addCategory()");
    console.log(catName+" | "+typeof(catName));
    var db = getDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql("INSERT INTO category VALUES(null, ?);", [catName]);
        }
    )
}

function addAccount(login, password, source, description, categoryId) {
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('INSERT INTO account VALUES(null, ?, ?, ?, ?, ?);', [login, password, source, description, categoryId]);
        }
    )
    return ret;
}

function categories() {
    console.log("categories()");
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('SELECT * FROM category;');
        }
    )
    return ret;
}

function categoryId(name) {
    var db = getDatabase();
    var ret = -1;
    db.transaction(
        function(tx) {
            var tmp = tx.executeSql('SELECT id FROM category WHERE name = ?;', [name]);
            if (tmp.rows.item(0) !== undefined)
                ret = tmp.rows.item(0);
        }
    )
    return ret;
}

function accounts(categoryId) {
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('SELECT * FROM account WHERE categoryId = ?;', [categoryId]);
        }
    )
}
