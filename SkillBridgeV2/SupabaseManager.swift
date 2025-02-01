//
//  SupabaseManager.swift
//  SkillBridgeV2
//
//  Created by Andrew Tran on 2/1/25.
//

import Supabase
import Foundation

let supabase = SupabaseClient(
    supabaseURL: URL(string: "supabase_url")!,
    supabaseKey: "supabase_key"
)

