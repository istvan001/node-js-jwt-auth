module.exports = {
  HOST: "s1.siralycore.hu",
  USER: "asztalfoglalas",
  PASSWORD: "istván",
  DB: "asztalfoglalas",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
