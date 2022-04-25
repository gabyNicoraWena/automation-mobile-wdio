module.exports = {
  plugins: [
    ['@babel/plugin-syntax-class-properties', { loose: true }],
    '@babel/plugin-transform-classes',
    '@babel/plugin-transform-computed-properties',
  ],
  presets: [
    [
      '@babel/preset-env',
      {
        targets: {
          node: 16,
        },
      },
    ],
  ],
}
