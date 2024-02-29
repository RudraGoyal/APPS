enum TransactionCategory { transport, food, miscellaneous, luxury }

TransactionCategory getTransactionCategory(String categoryName) {
  switch (categoryName) {
    case 'transport':
      return TransactionCategory.transport;
    case 'food':
      return TransactionCategory.food;
    case 'miscellaneous':
      return TransactionCategory.miscellaneous;
    case 'luxury':
      return TransactionCategory.luxury;
    default:
      return TransactionCategory.food;
  }
}
