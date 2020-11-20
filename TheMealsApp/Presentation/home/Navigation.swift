//
//  Navigation.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 20/11/20.
//

import SwiftUI

func navigateToDetailPage<Content: View>(
    for categoryResponse: CategoryResponse,
    @ViewBuilder content: () -> Content
) -> some View {
    NavigationLink(
        destination: DetailView(category: categoryResponse),
        label: {
            content()
        }
    )
}
