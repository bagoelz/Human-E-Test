
module.exports = function () {
    const { faker }  = require('@faker-js/faker');
    var _ = require("lodash");
    return {
        feedSubscribe: _.times(100, function (n) {
            return {
                feedId: n,
                feedName: faker.company.companyName(),
                feedProfile: faker.image.business(),
                subscriptionId:[]
            }
        })
    }
}