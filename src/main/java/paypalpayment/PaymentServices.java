/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paypalpayment;


import Model.OrderCustomerDetail;
import Model.OrderDetail;
import Model.OrderProduct;


import java.util.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

/**
 *
 * @author Jude Darren Victoria
 */
public class PaymentServices {
            private static final String CLIENT_ID = "AbknqJXPBoyTbt9EzJRxcXI78jkFk5Mx5Cc9aWZd-ePDyu11jZAv24HDgmgSC_kyvqRXpa1JjYUY_HVy";
            private static final String CLIENT_SECRET = "EF1ucW39V9ZGs4ldgZ0u7EDQeKjILqzyin7VyzGHi_cnRlNwx2ve5-G08aWzymelEc3nPUt-39CloYNx";
            private static final String MODE = "sandbox";

            public String authorizePayment(OrderDetail orderDetail, String OrderID)        
                    throws PayPalRESTException {
                
//                String OrderID= "1"; //TO-DO Feed order ID

                Payer payer = getPayerInformation(OrderID);
                RedirectUrls redirectUrls = getRedirectURLs();
                List<Transaction> listTransaction = getTransactionInformation(orderDetail);

                Payment requestPayment = new Payment();
                requestPayment.setTransactions(listTransaction);
                requestPayment.setRedirectUrls(redirectUrls);
                requestPayment.setPayer(payer);
                requestPayment.setIntent("authorize");

                APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

                Payment approvedPayment = requestPayment.create(apiContext);

                return getApprovalLink(approvedPayment);
 
    }
            
                OrderDAO orderdet = new OrderDAO();
                
                private Payer getPayerInformation(String orderId) {
                Payer payer = new Payer();
                payer.setPaymentMethod("paypal");

                // Retrieve email from placed_order table based on OrderID
                String customerEmail = orderdet.getCustomerEmailForOrder(orderId);

                if (customerEmail != null) {
                    // Retrieve customer information based on email
                    OrderCustomerDetail customer = orderdet.getCustomerInformationForOrder(customerEmail);

                    if (customer != null) {
                        // Set PayerInfo using customer information
                        PayerInfo payerInfo = new PayerInfo();
                        payerInfo.setFirstName(customer.getFullName())
                                 .setEmail(customer.getEmail());

                        payer.setPayerInfo(payerInfo);
                    }
                }

                return payer;
            }

            

        
    private RedirectUrls getRedirectURLs() {
    RedirectUrls redirectUrls = new RedirectUrls();
    redirectUrls.setCancelUrl("https://greensupermarket.software/UserDashboard.jsp");
    redirectUrls.setReturnUrl("https://greensupermarket.software/review_payment");
     
    return redirectUrls;
}
    
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
    float total = 0;
    Details details = new Details();
    details.setShipping("1");


    ItemList itemList = new ItemList();
    List<Item> items = new ArrayList<>();

    for (OrderProduct product : orderDetail.getProducts()) {
        Item item = new Item();
        item.setCurrency("USD");
        item.setName(product.getName());
        item.setPrice(String.format("%.2f", product.getUnitPrice()));
        item.setQuantity(String.valueOf(product.getQuantity()));
        total += product.getUnitPrice() * product.getQuantity();
        items.add(item);
    }

    itemList.setItems(items);

    Amount amount = new Amount();
    details.setSubtotal(String.format("%.2f",total));  // Assuming getTotal returns a float
    amount.setTotal(String.format("%.2f",total + 1));
    amount.setCurrency("USD");
    // amount.setDetails(new Details().setShipping(orderDetail.getShipping()).setTax(orderDetail.getTax()));
    amount.setDetails(details);


    Transaction transaction = new Transaction();
    transaction.setAmount(amount);
    transaction.setDescription("Order Details");
    transaction.setItemList(itemList);

    List<Transaction> listTransaction = new ArrayList<>();
    listTransaction.add(transaction);

    return listTransaction;
}
    
    
    private String getApprovalLink(Payment approvedPayment) {
    List<Links> links = approvedPayment.getLinks();
    String approvalLink = null;
     
    for (Links link : links) {
        if (link.getRel().equalsIgnoreCase("approval_url")) {
            approvalLink = link.getHref();
            break;
        }
    }      
     
    return approvalLink;
}

    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    return Payment.get(apiContext, paymentId);
}
    
    public Payment executePayment(String paymentId, String payerId)
        throws PayPalRESTException {
    PaymentExecution paymentExecution = new PaymentExecution();
    paymentExecution.setPayerId(payerId);
 
    Payment payment = new Payment().setId(paymentId);
 
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
    return payment.execute(apiContext, paymentExecution);
}
        
        
}
