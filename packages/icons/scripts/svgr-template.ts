const svgrTemplate = (
  { imports, interfaces, componentName, props, jsx, exports },
  { tpl }
) => {
  return tpl`${imports}
${interfaces}

export const ${componentName} = (${props}) => {
  return ${jsx};
}

${exports}
  `;
};

export default svgrTemplate;
