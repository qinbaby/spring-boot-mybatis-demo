var bootstrapTable = {
    datetimeFormatter : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value).format('YYYY-MM-DD HH:mm:ss');
        } else {
            return null;
        }
    },
    datetimeFormatterByYYMMDDHHmmss : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value, "YYMMDDHHmmss").format('YYYY-MM-DD HH:mm:ss');
        } else {
            return null;
        }
    },
    datetimeFormatterByYYYYMMDDHHmmss : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value, "YYYYMMDDHHmmss")
                .format('YYYY-MM-DD HH:mm:ss');
        } else {
            return null;
        }
    },
    datetimeFormatterByYYMMDDHHmmss : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value, "YYMMDDHHmmss").format('YY-MM-DD HH:mm:ss');
        } else {
            return null;
        }
    },
    datetimeFormatterByYYYYMMDD : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value, "YYYYMMDD").format('YYYY-MM-DD');
        } else {
            return null;
        }
    },
    datetimeFormatterByHHmmss : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value, "HHmmss").format('HH:mm:ss');
        } else {
            return null;
        }
    },
    timeFormatter : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value).format('HH:mm:ss');
        } else {
            return null;
        }
    },
    dateFormatter : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value).format('YYYY-MM-DD');
        } else {
            return null;
        }
    },
    datetimeFormatterByTimestamp : function(value, row, index) {
        if (value != null && value != '') {
            return moment(value).format('YYYY-MM-DD HH:mm:ss');
        } else {
            return null;
        }
    }
};