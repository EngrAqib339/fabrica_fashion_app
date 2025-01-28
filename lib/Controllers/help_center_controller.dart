class HelpCenterController {
  List<Map<String, dynamic>> getFAQs(String selectedCategory) {
    List<Map<String, dynamic>> faqs = [
      {"question": "Can I track my order's delivery status", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "Is there a return policy?", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "Can I save my favorite items for later?", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "Can I share products with my friends", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "How do I contact customer support", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "What payment methods are accepted", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
      {"question": "How do I add review", "answer": "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias"},
    ];

    if (selectedCategory == "All") {
      return faqs;
    } else {
      return faqs.where((faq) => faq['category'] == selectedCategory).toList();
    }
  }
}
