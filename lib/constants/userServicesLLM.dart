import 'dart:convert';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class llmFactory {
  final String content;

  llmFactory({required this.content});

  factory llmFactory.fromJson(Map<String, dynamic> json) {
    return llmFactory(
      content: json['choices'][0]['message']['content'],
    );
  }
}

class LLMUserServices {
  final String? oldContent;
  final String? language;

  const LLMUserServices({this.oldContent, this.language});

  Future<String> getLLMResponse() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfig.loadEnvVariables();
    final response = await http.post(
      Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer ${FlutterConfig.get('LLM_API_KEY')}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "meta-llama/llama-3.1-8b-instruct:free",
        "messages": [
          {
            "role": "user",
            "content":
                "${oldContent}. Please summarize and restructure the following text into a concise, professional, and well-organized format. Ensure the summary is divided into clear, coherent paragraphs, each focusing on a specific aspect of the news. The total length should be around 100-150 words. sure the summary is engaging and easy to read. Don't add anything else like This summary is structured into clear, coherent paragraphs, highlighting key points and ensuring an engaging and easy-to-read format at the end,  Do not include headlines or introduce your own thoughts or conclusions. Make the summary around 100-150words, give the response in 2 to 3 paragraphs, donot go beyond that words, donot add anything like in conclusion at the end. Choose good words so that people of every age love it. Detect the language and give the response in the same language.",
          }
        ]
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // print(data);

      llmFactory tempResponse = llmFactory.fromJson(data);

      // print(list);
      // print(tempResponse.content);
      return tempResponse.content;
    } else {
      throw Exception("HTTP Error");
    }
  }
}
