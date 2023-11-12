describe('product page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('opens the app', () => {})

  it("click on product to navigate to product details page", () => {
    cy.get(".products article")
      .first()
      .click()
  });
})